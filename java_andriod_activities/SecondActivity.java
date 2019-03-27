package com.pointpark.mymobileapp;

        import android.os.Bundle;
        import android.support.v7.app.AppCompatActivity;
        import android.content.Intent;
        import android.widget.TextView;

public class SecondActivity extends AppCompatActivity {

    private TextView showMsg;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);


        Bundle myextras = getIntent().getExtras();
        showMsg = (TextView) findViewById(R.id.txtView1);

        if (myextras != null) {
            String mymsg = myextras.getString("Message");
            int myNums = myextras.getInt("value");
            showMsg.setText("Message received from: " + mymsg + " And the value is: " + String.valueOf(myNums));

        }
    }
}
