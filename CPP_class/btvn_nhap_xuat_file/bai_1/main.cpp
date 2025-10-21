#include <fstream>
using namespace std;
ifstream fi ("mang1.txt");
ofstream fo ("mang2.txt");

bool ktnt(int n){
    if (n<2) return false;
    else if (n==2||n==3) return true;
    else if (n%2==0||n%3==0) return false;
    else {
        for (int i=5;i*i<=n;i+=6){
            if (n%i==0||n%(i+2)==0) return false;
        }
        return true;
    }
}

int main(){
    int n;
    vector<int> arr;
    int temp;
    int the_max=INT_MIN;
    while (fi>>temp){
        n++;
        the_max=max(the_max,temp);
        if (ktnt(temp)) arr.push_back(temp);
    }
    fo<<the_max<<endl;
    for (auto pt:arr) fo<<pt<<' ';
    return 0;
}
