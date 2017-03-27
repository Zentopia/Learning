package com.example.utopia.intent;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;

/**
 * Created by utopia on 2017/3/24.
 */

public class FirstActivity extends Activity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

//        Person person = (Person)getIntent().getSerializableExtra("person_data");
        ParcelablePerson person = (ParcelablePerson) getIntent().getParcelableExtra("person_data");

        Log.d("hello", person.getName());

    }
}
