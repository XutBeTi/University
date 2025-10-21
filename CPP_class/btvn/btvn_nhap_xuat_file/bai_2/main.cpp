#include <fstream.h>
using namespace std;
ifstream fi ("data.in");
ofstream fo ("data.out");
int main(){
    int n;
    cin.ignore()
    string temp;
    while (n--){
        getline(fi,temp);
        fo<<temp<<'\n';
    }
    fi.close();
    fo.close();
    return 0;
}
