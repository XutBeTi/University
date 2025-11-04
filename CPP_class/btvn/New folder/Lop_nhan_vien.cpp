#include <bits/stdc++.h>
using namespace std;
ifstream fi ("data.in");
ofstream fo ("data.out");

class Employee {
private :
    char* name;
    int age;
    float salary;
public:

    Employee() {
        name = new char[1];
        name[0] = '\0';
        age = 18;
        salary = 100;
    }


    Employee  (const char* n, int a, float s) {
        name = new char[strlen(n) + 1];
        strcpy(name, n);
        age = a;
        salary = s;
    }

    void setName(const char* n) {
        delete[] name;
        name = new char[strlen(n) + 1];
        strcpy(name, n);
    }
    char* getName() {
        return name;
    }

    void setAge(int a) {
        age = a;
    }
    int getAge() {
        return age;
    }

    void setSalary(float s) {
        salary = s;
    }
    float getSalary() {
        return salary;
    }

     void show() {
        cout << "Ten: " << name << endl;
        cout << "Tuoi: " << age << endl;
        cout << "Luong: " << salary << endl;
        cout << endl;
    }

    ~Employee() {
        delete[] name;
    }

};

int main() {
    /*
    Employee nv1;
    nv1.show();
    return 0;
    */

    /*
    Employee nv1;
    char tempName[100];
    int tempAge;
    float tempSalary;

    cout << "Nhap ten: ";
    cin.getline(tempName, 100);
    cout << "Nhap tuoi: ";
    cin >> tempAge;
    cout << "Nhap luong: ";
    cin >> tempSalary;

    nv1.setName(tempName);
    nv1.setAge(tempAge);
    nv1.setSalary(tempSalary);

    nv1.show();
    */


    /*
    Employee e1("Hoang", 25, 1500);
    e1.show();
    */

    /*
    Employee* ePtr = new Employee("An", 30, 2000);
    ePtr->show();
    delete ePtr;
    */

    int n;
    cout << "Nhap so luong nhan vien: ";
    cin >> n;
    cin.ignore();

    Employee* arr = new Employee[n];

    char tempName[100];
    int tempAge;
    float tempSalary;

    for (int i = 0; i < n; i++) {
        cout << "Nhap thong tin nhan vien thu " << i+1 << endl;
        cout << "Ten: ";
        cin.getline(tempName, 100);
        cout << "Tuoi: ";
        cin >> tempAge;
        cout << "Luong: ";
        cin >> tempSalary;
        cin.ignore();

        arr[i].setName(tempName);
        arr[i].setAge(tempAge);
        arr[i].setSalary(tempSalary);
        cout << endl;
    }

    cout << "\n Danh sach nhan vien :\n";
    for (int i = 0; i < n; i++) {
        cout<<i+1<<":\n";
        arr[i].show();
    }

    delete[] arr;

    return 0;

}
