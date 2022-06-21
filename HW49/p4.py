#from itertools import count
import sys
import boto3

def get_list_ami():
  response = ec2.describe_images( Owners = ['self'] )
  for list_id in response['Images']:
      
    list_ami.append(list_id['Name'])
    list_ami.append(list_id['ImageId'])
   
  return list_ami


try:
    s_region = input("Enter a source region [us-east-1] :") or "us-east-1"  #us-east-1
    t_region = input("Enter a tagget region [eu-central-1] :") or "eu-central-1"  #eu-central-1
    ec2 = boto3.client('ec2', t_region)
    ec2 = boto3.client('ec2', s_region)
except :
    print("Input error or non-existent region !")
    sys.exit()

list_ami = []
print('Choose an AMI number:')

list_of_ami = get_list_ami()
i = 0
list_of_index = []
for e in list_of_ami :
    if i % 2  == 0:
       print(int((i+2)/2)," - ", list_of_ami[i], list_of_ami[i+1])
       list_of_index.append(int((i+2)/2))
    i += 1

index_of_ami = input()

if index_of_ami.isdigit():
    index_of_ami = int(index_of_ami)
else:
    print ('Input error !')
    sys.exit()


if (index_of_ami not in list_of_index) :   
    print ('Non-existent AMI !')
    sys.exit()

print("Start copy from",s_region,"to",t_region, list_of_ami[(index_of_ami)*2-2])

ec2 = boto3.client('ec2', t_region)
response = ec2.copy_image(
    Description='',
    Name=list_of_ami[(index_of_ami)*2-2],
    SourceImageId=list_of_ami[(index_of_ami)*2-1],
    SourceRegion=s_region
)
