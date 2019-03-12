package com.pointpark.learnjava;

        /*
            Author: Tanner Campbell
            Date Created: 3/6/2019
            Date Modified: 3/6/2019
            Description: This is an introduction to Java
         */

public class Sandbox {
    public static void main(String[] args) {

        // Declare variable types
        String vehicle = "Toyota";
        String make = "4Runner";
        String year = "2016";
        String printAccNum = "";
        int accountNumber = 123456;

        // This is my starting method
        // System.out.println(year + " " + vehicle + " " + make);

        // Upper Case Statements
        String uppercase = "ORACLE";
        String lower = uppercase.toLowerCase();
        System.out.println(uppercase + " " +lower);

        // Convert A Number into a string value
        printAccNum = String.format("You are converting the account number to a string " + accountNumber);
        System.out.println(printAccNum);

    }
}
