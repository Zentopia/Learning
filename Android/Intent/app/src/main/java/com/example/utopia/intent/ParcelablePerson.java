package com.example.utopia.intent;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by utopia on 2017/3/27.
 */

public class ParcelablePerson implements Parcelable{

    private String name;
    private int age;

    public void setName(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge(){
        return age;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(name);
        parcel.writeInt(age);
    }

    public static final Parcelable.Creator<ParcelablePerson> CREATOR = new Parcelable.Creator<ParcelablePerson>(){
        @Override
        public ParcelablePerson createFromParcel(Parcel parcel) {
            ParcelablePerson person = new ParcelablePerson();
            person.name = parcel.readString(); //读取的顺序要和写入的顺序相同
            person.age = parcel.readInt();

            return person;
        }

        @Override
        public ParcelablePerson[] newArray(int i) {
            return new ParcelablePerson[i];
        }
    };


}
