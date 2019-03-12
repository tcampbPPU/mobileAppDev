package com.pointpark.learnjava;

public class MyMethods {
    public static void main(String[] args) {

        // Starting point...
        GetData();

        GetTvShow("Trailer Park Boys", 9);

        System.out.println(getArea(100, 50));

    }

    public static void GetData() {
        System.out.println("Something");
    }

    public static void GetTvShow(String tvShow, int yearsOn) {
        System.out.println(tvShow + " Years on TV is: " + yearsOn);
    }

    public static int getArea(int length, int width) {

        int returnVal = length + width;
        return returnVal;
    }
}