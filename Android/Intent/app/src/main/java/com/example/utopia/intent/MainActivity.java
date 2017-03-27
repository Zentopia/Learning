package com.example.utopia.intent;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ParcelablePerson person = new ParcelablePerson();
        person.setName("Tom");
        person.setAge(20);
        Intent intent = new Intent(MainActivity.this, FirstActivity.class);

        intent.putExtra("person_data", person);

        startActivity(intent);

    }
}
