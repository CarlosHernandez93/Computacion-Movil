package com.example.proyecto009;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;


public class MainActivity extends AppCompatActivity {

    private ImageView iv1;
    private Button btn1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        iv1 = findViewById(R.id.imageView);
        btn1 = findViewById(R.id.boton1);
    }

    public void Ocultar(View v){
        btn1.setVisibility(View.INVISIBLE);
        iv1.setVisibility(View.VISIBLE);
    }
}