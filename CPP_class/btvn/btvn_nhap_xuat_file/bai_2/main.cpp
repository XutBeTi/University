#include <bits/stdc++.h>
using namespace std;
ifstream fi ("data.in");
ofstream fo ("data.out");


int main(){
    string temp;
    while (getline(fi,temp)){
        fo<<temp<<'\n';
    }
    fi.close();
    fo.close();
    return 0;
}
