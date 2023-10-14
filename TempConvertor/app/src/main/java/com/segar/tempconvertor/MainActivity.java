package com.segar.tempconvertor;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.*;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    EditText e;

    Button fartocel, celtofar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        e = findViewById(R.id.editTextNumber);
        fartocel=findViewById(R.id.fartocel);
        celtofar=findViewById(R.id.celtofar);
        fartocel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                double p1 = Double.parseDouble((e.getText().toString()));
                double k1 = (((p1-32)*5)/9);
                System.out.println(p1);
                double temp = p1-32;
                System.out.println(temp*1.8);

                e.setText(String.format("%.2f",k1));
                Toast.makeText(MainActivity.this, String.format("%.2f",k1), Toast.LENGTH_SHORT).show();
            }
        });
        celtofar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                double p = Double.parseDouble((e.getText().toString()));
                double k = ((1.8*p)+32);
                e.setText(String.format("%.2f",k));
                Toast.makeText(MainActivity.this, String.format("%.2f",k), Toast.LENGTH_SHORT).show();
            }
        });

    }
}