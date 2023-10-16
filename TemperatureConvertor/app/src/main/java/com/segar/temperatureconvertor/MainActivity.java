package com.segar.temperatureconvertor;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
Button ctf;
Button ftc;
TextView display;
EditText textbox;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ctf=findViewById(R.id.ctf);
        ftc=findViewById(R.id.ftc);
        display=findViewById(R.id.display);
        textbox=findViewById(R.id.tempvalue);


        ctf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String val=textbox.getText().toString();
                if (val.isEmpty()){
                    display.setText("Enter the Temperature.");
                }
                else{
                    double c = Double.parseDouble(val);
                    double res= (c*(1.8))+32;
                    display.setText("Fahrenheit:  "+String.format("%.2f",res)+"°F");
                }


            }
        });
        ftc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String val=textbox.getText().toString();
                if (val.isEmpty()){
                    display.setText("Enter the Temperature.");
                }
                else {
                    double f = Double.parseDouble(val);
                    double res = ((f - 32) * (5.0 / 9.0));
                    display.setText("Celcius:  " + String.format("%.2f", res) + "°C");
                }
            }
        });
    }
}