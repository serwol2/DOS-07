from github import Github

mytoken = input("Enter Github token: ") 
mynamegit = "serwol2"
my_file_search = "properties"

g = Github(mytoken) 

def take_list_repo(mygit):
    mylist = []
    for repo in mygit.get_user().get_repos():
        mylist.append(repo.name)
    return(mylist)    


def take_list_files(mygit,myname,myrepo):
    listfiles = []
    repo = mygit.get_repo(myname+"/"+myrepo)
    contents = repo.get_contents("")
    while contents:
        file_content = contents.pop(0)
        if file_content.type == "dir":
            contents.extend(repo.get_contents(file_content.path))
        else:
            listfiles.append(file_content.name)
    return(listfiles)


for rep in take_list_repo(g):
    for f in take_list_files(g,"serwol2",rep):
        if f.find(my_file_search) != -1 :
            print(rep)
            break