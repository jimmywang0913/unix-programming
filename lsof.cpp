#include <sys/types.h>
#include <dirent.h>
#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include <pwd.h>
#include <filesystem>
#include <unistd.h>
#include <memory.h>
#include <sys/stat.h>
#include <regex>

using namespace std;

struct fd
{
    string f;
    string type;
    int node;
    string name;
    int right;
};
struct data{
    string command;
    int pid;
    string user;
    vector<fd* > list;
};
string T_arg="NULL",F_arg="NULL",C_arg="NULL";
bool t_flag=0,f_flag=0,c_flag=0;
vector<string> split(const string& str, const string& delim);
string getuser(uid_t uid);
int getinode(string name);
int getdir(string dir, vector<data> &files, vector<string> &id);
void print(data *page);
void print ();
vector<data* >ans;
vector<data* >ans2;
int main(int argc, char *argv[]){
    string dir = string("/proc");//資料夾路徑(絕對位址or相對位址)
    vector<data> files = vector<data>();
    vector<string> id = vector<string>();
    for (int i=1;i<argc;i+=2){
        char *arg = argv[i];
        if (arg[0]=='-'){
            if (arg[1]=='t'){
                T_arg.assign(argv[i+1]);
                t_flag=true;
                if (F_arg != "REG" || F_arg != "CHR"|| F_arg != "DIR" || F_arg != "FIFO" || F_arg !="SOCK" || F_arg!= "unknown"){
                    cout<<"Invalid TYPE option."<<endl;
                    return 0;
                }
            }
            else if(arg[1]=='f'){
                F_arg.assign(argv[i+1]);
                f_flag=true;
            }
            else if(arg[1]=='c'){
                C_arg.assign(argv[i+1]);
                c_flag=true;
            }
            else {
                cout<<"wrong argument type"<<endl;
                return 0;
            }
        }
        else {
             cout<<"wrong argument type"<<endl;
             return 0;
            }
    }
    cout<<"COMMAND\tPID\tUSER\tFD\tTYPE\tNODE\tNAME"<<endl;
    getdir(dir, files, id);
    return 0;
}
bool checknum(const string& str){
    for (char const &c : str){
        if (isdigit(c)==0)return false;
    }
    return true;
}
int getdir(string dir, vector<data> &files,vector<string> &id){
    DIR *dp;//創立資料夾指標
    struct dirent *dirp;
    if((dp = opendir(dir.c_str())) == NULL){
        cout << "Error(" << errno << ") opening " << dir << endl;
        return errno;
    }
    while((dirp = readdir(dp)) != NULL){//如果dirent指標非空
        if (checknum(string(dirp->d_name))){
            id.push_back(string(dirp->d_name));//將資料夾和檔案名放入vector
        }
    }
    for (int i=0;i<id.size();i++){
        data* page = new data();
        page->pid= stoi(id[i]);
        string f = string("/proc/") + id[i] + string("/comm");
        ifstream file;
        file.open(f,ios::in);
        char str1[100];
        file.getline(str1,100);
        page->command = str1;
        file.close();
        f = string("/proc/") + id[i] + string("/uid_map");
        file.open(f,ios::in);
        memset(str1,0,100);
        file.read(str1,100);
        int uid=0;
        bool flag=0;
        for (int i=0;i<100;i++){
            if (isdigit(str1[i])){
                flag=1;
                uid*=10;
                uid+= str1[i] - '0';
            }
            else {
                if (flag==1){
                    break;
                }
            }
        }
        string username = getuser(uid);
        page->user = username;
        //cout << username <<" "<< page->pid<<" ";
        file.close();
        f = string("/proc/") + id[i] + string("/cwd");
        file.open(f,ios::in);
        flag = file.good();
        memset(str1,0,100);
        string name;
        fd* page1= new fd();
        if (flag==false){
            name = "readlink: Permission denied";
            page1->f = "cwd";
            page1->type = "DIR";
            page1->name = f;
            page1->right=1;
            page1->node = -1;
        }
        else {
            file.read(str1,100);
            const char *c = f.c_str();
            int count = readlink(c,str1,100);
            name = str1;
            page1->f = "cwd";
            page1->type = "DIR";
            page1->name = name;
            page1->right=0;
            page1->node = getinode(name);
        }
        page->list.push_back(page1);
        file.close();
        f = string("/proc/") + id[i] + string("/root");
        file.open(f,ios::in);
        flag = file.good();
        memset(str1,0,100);
        fd* page2= new fd();
        if (flag==0){
            name = "readlink: Permission denied";
            page2->f = "root";
            page2->type = "DIR";
            page2->name = f;
            page2->right=1;
            page2->node = -1;
        }
        else {
            file.read(str1,100);
            const char *c = f.c_str();
            int count = readlink(c,str1,100);
            name = str1;
            page2->f = "root";
            page2->type = "DIR";
            page2->right=0;
            page2->name = name;
            page2->node = getinode(name);
        }
        page->list.push_back(page2);
        file.close();
        f = string("/proc/") + id[i] + string("/exe");
        file.open(f,ios::in);
        flag = file.good();
        memset(str1,0,100);
        fd* page3= new fd();
        if (flag==0){
            name = "readlink: Permission denied";
            page3->f = "exe";
            page3->type = "REG";
            page3->name = f;
            page3->right=1;
            page3->node = -1;
        }
        else {
            file.read(str1,100);
            const char *c = f.c_str();
            int count = readlink(c,str1,100);
            name = str1;
            page3->f = "exe";
            page3->type = "REG";
            page3->name = name;
            page3->right=0;
            page3->node = getinode(name);
        }
        page->list.push_back(page3);
        file.close();
        f = string("/proc/") + id[i] + string("/maps");
        string s;
        ifstream fin(f);
        vector<string> known;
        while(getline(fin,s)){
            vector<string> dirs= split(s," ");
            name = dirs[dirs.size()-1];
            if (name[0]=='('&&name[1]=='d'&&name[2]=='e'){
                fd* pages= new fd();
                string name2;
                name2 = dirs[dirs.size()-2];
                pages->f = "del";
                pages->name = name2;
                pages->node = -1;
                pages->type = "unknown";
                pages->right = 0;
                page->list.push_back(pages);
            }
            else {
                bool find=0;
                for (int i=0;i<known.size();i++){
                    if (name.compare(known[i])==0){
                        find = 1;
                    }
                }
                if (name[0]=='/'){
                    if (find == 0){
                        known.push_back(name);
                    }
                }
            }
        }
        for (int i=0;i<known.size();i++){
            fd* pages= new fd();
            name=known[i];
            pages->f = "mem";
            struct stat file_stat;
            const char *c = name.c_str();
            stat(c, &file_stat);
            if (file_stat.st_mode & S_IFDIR){
                pages->type = "DIR";
            }
            else if (file_stat.st_mode & S_IFREG){
                pages->type = "REG";
            }
            pages->node = file_stat.st_ino;
            pages->right = 0;
            pages->name = name;
            page->list.push_back(pages);
        }
        f = string("/proc/") + id[i] + string("/fd");
        DIR *dir1; struct dirent *diread;
        if ((dir1 = opendir(f.c_str())) != nullptr) {
                while ((diread = readdir(dir1)) != nullptr) {
                    struct stat file_stat;
                    const char *c = diread->d_name;
                    string file_path = f+"/"+c;
                    int op = stat(file_path.c_str(), &file_stat);
                    if (op == -1){
                        fd* pages= new fd();
                        pages->f = "NOFD";
                        pages->name = f;
                        pages->node = -1;
                        pages->right = 2;
                        pages->type = "";
                        page->list.push_back(pages);
                    }
                    if (S_ISSOCK(file_stat.st_mode)){
                        fd* pages= new fd();
                        string socketname = diread->d_name;
                        if (file_stat.st_mode & S_IRUSR){
                            if (file_stat.st_mode & S_IWUSR){
                                pages->f = socketname+"u";
                            }
                            else{
                                pages->f = socketname+"r";
                            } 
                        }
                        else {
                            pages->f = socketname+"w";
                        }
                        char c[100];
                        memset(c,0,100);
                        readlink(file_path.c_str(),c,100);
                        string info(c);
                        pages->right = 0;
                        pages->name = info;
                        pages->node = diread->d_ino;
                        pages->type = "SOCK";
                        page->list.push_back(pages);
                    }
                    else if (S_ISFIFO(file_stat.st_mode)){
                        fd* pages= new fd();
                        string socketname = diread->d_name;
                        if (file_stat.st_mode & S_IRUSR){
                            if (file_stat.st_mode & S_IWUSR){
                                pages->f = socketname+"u";
                            }
                            else{
                                pages->f = socketname+"r";
                            } 
                        }
                        else {
                            pages->f = socketname+"w";
                        }
                        char c2[100];
                        memset(c2,0,100);
                        readlink(file_path.c_str(),c2,100);
                        bool flag2=0;
                        for (int i=0;i<100;i++){
                            if (c2[i]==']'&& flag2==0){
                                flag2=1;
                            }
                            else if (flag2==1){
                                c2[i]=0;
                            }
                        }
                        string info(c2);
                        pages->name = info;
                        pages->node = diread->d_ino;
                        pages->right = 0;
                        pages->type = "FIFO";
                        page->list.push_back(pages);
                    }
                    else if (S_ISCHR(file_stat.st_mode)){
                        fd* pages= new fd();
                        string socketname = diread->d_name;
                        if (file_stat.st_mode & S_IRUSR){
                            if (file_stat.st_mode & S_IWUSR){
                                pages->f = socketname+"u";
                            }
                            else{
                                pages->f = socketname+"r";
                            } 
                        }
                        else {
                            pages->f = socketname+"w";
                        }
                        char c1[100];
                        memset(c1,0,100);
                        readlink(file_path.c_str(),c1,100);
                        string info;
                        info.assign(c1);
                        pages->name = info;
                        pages->node = diread->d_ino;
                        pages->type = "CHR";
                        pages->right = 0;
                        page->list.push_back(pages);
                    }
                }
                closedir (dir1);
            }
        ans.push_back(page);
    }
    closedir(dp);
    print();
    return 0;
}
int getinode(string name){
    struct stat file_stat;
    const char *c = name.c_str();
    stat(c, &file_stat);
    return file_stat.st_ino;
}
string getuser(uid_t uid){
    struct passwd *pw;
    pw = getpwuid(uid);
    return pw->pw_name;
}
void print (){
    if (c_flag){
        for (int i=0;i<ans.size();i++){
            regex e (C_arg);
            smatch m;
            if (regex_search(ans[i]->command,m,e)){
                print (ans[i]);
            }
        }
    }
    else {
        for (int i=0;i<ans.size();i++){
            print (ans[i]);
        }
    }
}
void print(data *page){
    for (int i=0;i<page->list.size();i++){
        if (f_flag==true&&t_flag==true){
            regex e (F_arg);
            smatch m;
            if (T_arg[0]==page->list[i]->type[0]&&regex_search(page->list[i]->name,m,e)){
                cout<< page->command << "\t"<<page->pid<<"\t"<<page->user<<"\t"<<page->list[i]->f<<"\t"<<page->list[i]->type<<"\t";
                if (page->list[i]->node==-1){
                    cout << "unknown"<<"\t"<<page->list[i]->name;
                }
                else {
                    cout<<page->list[i]->node<<"\t"<<page->list[i]->name;
                }
                if (page->list[i]->right==1){
                    cout<< " (readlink: Permission denied)" <<endl;
                }else if (page->list[i]->right==2){
                    cout<<" (opendir: Permission denied)" <<endl;
                }
                else {
                    cout <<endl;
                }
            }
        }
        else if (f_flag==true){
            regex e(F_arg);
            smatch m;
            if(regex_search(page->list[i]->name,m,e)){
                cout<< page->command << "\t"<<page->pid<<"\t"<<page->user<<"\t"<<page->list[i]->f<<"\t"<<page->list[i]->type<<"\t";
                if (page->list[i]->node==-1){
                    cout << "unknown"<<"\t"<<page->list[i]->name;
                }
                else {
                    cout<<page->list[i]->node<<"\t"<<page->list[i]->name;
                }
                if (page->list[i]->right==1){
                    cout<< " (readlink: Permission denied)" <<endl;
                }else if (page->list[i]->right==2){
                    cout<<" (opendir: Permission denied)" <<endl;
                }
                else {
                    cout <<endl;
                }
            }
        }
        else if (t_flag==true){
            if (T_arg[0]==page->list[i]->type[0]){
                cout<< page->command << "\t"<<page->pid<<"\t"<<page->user<<"\t"<<page->list[i]->f<<"\t"<<page->list[i]->type<<"\t";
                if (page->list[i]->node==-1){
                    cout << "unknown"<<"\t"<<page->list[i]->name;
                }
                else {
                    cout<<page->list[i]->node<<"\t"<<page->list[i]->name;
                }
                if (page->list[i]->right==1){
                    cout<< " (readlink: Permission denied)" <<endl;
                }else if (page->list[i]->right==2){
                    cout<<" (opendir: Permission denied)" <<endl;
                }
                else {
                    cout <<endl;
                }
            }
        }
       else{
            cout<< page->command << "\t"<<page->pid<<"\t"<<page->user<<"\t"<<page->list[i]->f<<"\t"<<page->list[i]->type<<"\t";
            if (page->list[i]->node==-1){
                cout << "unknown"<<"\t"<<page->list[i]->name;
            }
            else {
                cout<<page->list[i]->node<<"\t"<<page->list[i]->name;
            }
            if (page->list[i]->right==1){
                cout<< " (readlink: Permission denied)" <<endl;
            }else if (page->list[i]->right==2){
                cout<<" (opendir: Permission denied)" <<endl;
            }
            else {
                cout <<endl;
            }
        }
    }
}
vector<string> split(const string& str, const string& delim) {  
	vector<string> res;  
	if("" == str) return res;  
	char * strs = new char[str.length() + 1] ; //不要忘了  
	strcpy(strs, str.c_str());   

	char * d = new char[delim.length() + 1];  
	strcpy(d, delim.c_str());  

	char *p = strtok(strs, d);  
	while(p) {  
		string s = p; //分割得到的字串轉換為string型別  
		res.push_back(s); //存入結果陣列  
		p = strtok(NULL, d);  
	}
	return res;  
}