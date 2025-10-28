#include <bits/stdc++.h>
using namespace std;

class SinhVien{
    private:
        string id,ten,lop,nnns;
        double gpa;
    public:
        void setid(){
            id="B20DCCN001";
        };
        void xuly(){
            setid();
            stringstream ss(nnns);
            string ngay,thang,nam;
            getline (ss,ngay,'/');
            getline (ss,thang,'/');
            getline (ss,nam,'/');
            if (ngay.length()==1) ngay="0"+ngay;
            if (thang.length()==1) thang="0"+thang;
            nnns=ngay+"/"+thang+"/"+nam;

        };
        void nhap(){
            getline (cin,ten);
            getline (cin,lop);
            getline (cin,nnns);
            xuly();
            cin>>gpa;
        };
        void xuat(){
            cout<<id<<' ';
            cout<<ten<<' ';
            cout<<lop<<' ';
            cout<<nnns<<' ';
            cout<<fixed<<setprecision(2)<<gpa<<' ';
        };
};
int main(){
    SinhVien a;
    a.nhap();
    a.xuat();
    return 0;
}
