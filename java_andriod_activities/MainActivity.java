package com.pointpark.mymobileapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    private Button SecondPageBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_first);

        SecondPageBtn = (Button) findViewById(R.id.btnSubmit);
        SecondPageBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, SecondActivity.class);
                intent.putExtra("Message", "The main activity said hello!");
                intent.putExtra("SecondMsg", "Second Page says hello!");
                intent.putExtra("value", 90210);

                startActivity(intent);
                //startActivity(new Intent(MainActivity.this, SecondActivity.class));
            }
        });
    }
}











//package com.pointpark.mymobileapp;
//
//    /*
//        Author: Tanner Campbell
//        Date Created: 03/13/2019
//        Date Modified: 03/13/2019
//     */
//
//import android.graphics.Color;
//import android.support.v7.app.AppCompatActivity;
//import android.os.Bundle;
//import android.view.View;
//import android.widget.Button;
//import android.widget.EditText;
//import android.widget.TextView;
//
//public class MainActivity extends AppCompatActivity {
//
//    private Button btnSubmit;
//    private TextView txtView1;
//    private EditText txtBox;
//
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.newlayout);
//
//        // Button Stuff...
//        btnSubmit = (Button) findViewById(R.id.button1);
//        btnSubmit.setText(R.string.button_name);
//        btnSubmit.setTextColor(Color.RED);
//
//        // TextView Stuff...
//        txtView1 = (TextView) findViewById(R.id.txtView1);
//
//        // EditText Stuff...
//        txtBox = (EditText) findViewById(R.id.txtBox);
//
//        /*
//        btnSubmit.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                txtView1.setVisibility(View.VISIBLE);
//                txtView1.setText(R.string.show_text);
//
//            }
//        });
//        */
//    }
//
//
//    public void activateBtn(View view) {
//        txtView1.setVisibility(View.VISIBLE);
//        txtView1.setText(txtBox.getText());
//
//    }
//}
