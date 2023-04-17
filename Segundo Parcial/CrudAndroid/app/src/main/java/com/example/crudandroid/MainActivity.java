package com.example.crudandroid;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.example.crudandroid.model.Empleado;
import com.example.crudandroid.sinterface.CrudEmpleadoInterface;
import com.google.gson.Gson;

import java.util.List;

import okhttp3.MediaType;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
    CrudEmpleadoInterface crudempleado;
    List<Empleado> listEmpleado;
    EditText textId;
    EditText textNombre;
    EditText textPassword;
    EditText textEmail;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void getAll(View view){

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.50:8081/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        crudempleado = retrofit.create(CrudEmpleadoInterface.class);
        Call<List<Empleado>> call = crudempleado.getAll();

        call.enqueue(new Callback<List<Empleado>>() {
            @Override
            public void onResponse(Call<List<Empleado>> call, Response<List<Empleado>> response) {
                if(!response.isSuccessful()){
                    System.out.println(response.message());
                    return;
                }
                listEmpleado = response.body();
                //listEmpleado.forEach(p-> System.out.println(p.toString()));
                listEmpleado.forEach(p-> Log.i("Empleado: ",p.toString()));
            }

            @Override
            public void onFailure(Call<List<Empleado>> call, Throwable t) {
                //System.out.println(t.getMessage());
                Log.e("Throw error: ",t.getMessage());
            }
        });
    }

    public void createEmployee(View view){
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.50:8081/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        crudempleado = retrofit.create(CrudEmpleadoInterface.class);
        textId = findViewById(R.id.editTextID);
        textNombre = findViewById(R.id.editTextNombre);
        textPassword = findViewById(R.id.editTextPassword);
        textEmail = findViewById(R.id.editTextEmail);
        Long ID = Long.parseLong(textId.getText().toString());
        String nombre = textNombre.getText().toString();
        String password = textPassword.getText().toString();
        String email = textEmail.getText().toString();
        Empleado empleado = new Empleado(ID, nombre, password, email);
        RequestBody requestBody = RequestBody.create(MediaType.parse("application/json"),
                new Gson().toJson(empleado));
        Call<Empleado> call = crudempleado.createEmployee(requestBody);

        call.enqueue(new Callback<Empleado>() {
            @Override
            public void onResponse(Call<Empleado> call, Response<Empleado> response) {
                if (response.isSuccessful()) {
                    System.out.println(response.message());
                    return;
                }
                System.out.println(response.body());
            }

            @Override
            public void onFailure(Call<Empleado> call, Throwable t) {
                Log.e("Throw error: ",t.getMessage());
            }
        });
        textId.setText("");
        textNombre.setText("");
        textPassword.setText("");
        textEmail.setText("");
    }

    public void deleteEmployee(View view){
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.50:8081/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        crudempleado = retrofit.create(CrudEmpleadoInterface.class);
        textId = findViewById(R.id.editTextID);
        Long id = Long.parseLong(textId.getText().toString());
        Call<Void> call = crudempleado.deleteEmployee(id);
        call.enqueue(new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (response.isSuccessful()) {
                    System.out.println(response.message());
                    return;
                }
                System.out.println(response.body());
            }

            @Override
            public void onFailure(Call<Void> call, Throwable t) {
                Log.e("Throw error: ",t.getMessage());
            }
        });
        textId.setText("");
    }

    public void searchEmployee(View view){
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.50:8081/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        crudempleado = retrofit.create(CrudEmpleadoInterface.class);
        textId = findViewById(R.id.editTextID);
        textNombre = findViewById(R.id.editTextNombre);
        textPassword = findViewById(R.id.editTextPassword);
        textEmail = findViewById(R.id.editTextEmail);
        Long id = Long.parseLong(textId.getText().toString());
        Call<Empleado> call = crudempleado.searchEmployee(id);
        call.enqueue(new Callback<Empleado>() {
            @Override
            public void onResponse(Call<Empleado> call, Response<Empleado> response) {
                if (response.isSuccessful()) {
                    Empleado empleado = response.body();
                    textNombre.setText(empleado.getNombre());
                    textPassword.setText(empleado.getPassword());
                    textEmail.setText(empleado.getEmail());
                }
            }

            @Override
            public void onFailure(Call<Empleado> call, Throwable t) {
                Log.e("Throw error: ",t.getMessage());
            }
        });
    }

    public void updateEmployee(View view){
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.50:8081/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        crudempleado = retrofit.create(CrudEmpleadoInterface.class);
        textId = findViewById(R.id.editTextID);
        textNombre = findViewById(R.id.editTextNombre);
        textPassword = findViewById(R.id.editTextPassword);
        textEmail = findViewById(R.id.editTextEmail);
        Long ID = Long.parseLong(textId.getText().toString());
        String nombre = textNombre.getText().toString();
        String password = textPassword.getText().toString();
        String email = textEmail.getText().toString();
        Empleado empleado = new Empleado(ID, nombre, password, email);
        RequestBody requestBody = RequestBody.create(MediaType.parse("application/json"),
                new Gson().toJson(empleado));
        Call<Empleado> call = crudempleado.updateEmployee(ID, requestBody);

        call.enqueue(new Callback<Empleado>() {
            @Override
            public void onResponse(Call<Empleado> call, Response<Empleado> response) {
                if (response.isSuccessful()) {
                    System.out.println(response.message());
                    return;
                }
                System.out.println(response.body());
            }

            @Override
            public void onFailure(Call<Empleado> call, Throwable t) {
                Log.e("Throw error: ",t.getMessage());
            }
        });
        textId.setText("");
        textNombre.setText("");
        textPassword.setText("");
        textEmail.setText("");
    }
}