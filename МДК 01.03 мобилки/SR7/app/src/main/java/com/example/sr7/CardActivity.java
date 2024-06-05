package com.example.sr7;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class CardActivity extends AppCompatActivity {

    private EditText editText1;
    private EditText editText2;
    private EditText editText3;
    private EditText editText4;
    private Spinner genderSpinner;

    static String text1, text2, text3, text4, selectedGender;
    static CharSequence selectedGender1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_card);

        editText1 = findViewById(R.id.editText);
        editText2 = findViewById(R.id.editText2);
        editText3 = findViewById(R.id.editText3);
        editText4 = findViewById(R.id.editText4);

        genderSpinner = findViewById(R.id.genderSpinner);
        selectedGender1 = genderSpinner.getPrompt();
        Button button = findViewById(R.id.button1);
        button.setEnabled(false); // Изначально делаем кнопку неактивной

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.genders_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        genderSpinner.setAdapter(adapter);

        TextWatcher textWatcher = new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                checkFieldsForEmptyValues();
            }

            @Override
            public void afterTextChanged(Editable s) {}
        };

        editText1.addTextChangedListener(textWatcher);
        editText2.addTextChangedListener(textWatcher);
        editText3.addTextChangedListener(textWatcher);
        editText4.addTextChangedListener(textWatcher);

        genderSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                checkFieldsForEmptyValues();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {}
        });

        TextView skipButton = findViewById(R.id.skipButton);
        skipButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(CardActivity.this, AMainActivity.class);
                startActivity(intent);
            }
        });
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(CardActivity.this, AMainActivity.class);
                startActivity(intent);
            }
        });
    }

    private void checkFieldsForEmptyValues() {
        text1 = editText1.getText().toString().trim();
        text2 = editText2.getText().toString().trim();
        text3 = editText3.getText().toString().trim();
        text4 = editText4.getText().toString().trim();
        selectedGender = genderSpinner.getSelectedItem().toString();
        selectedGender1 = genderSpinner.getPrompt();


        Button button1 = findViewById(R.id.button1);
        if (!TextUtils.isEmpty(text1) && !TextUtils.isEmpty(text2) && !TextUtils.isEmpty(text3)
                && !TextUtils.isEmpty(text4) && !TextUtils.isEmpty(selectedGender) && isValidDate(text4)) {
            button1.setEnabled(true);
            button1.setBackgroundResource(R.drawable.rounded_button);
        } else {
            button1.setEnabled(false);
            button1.setBackgroundResource(R.drawable.rounded_button1);
        }
    }

    private boolean isValidDate(String dateStr) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy", Locale.getDefault());
        sdf.setLenient(false); // Не допускаем "мягкую" интерпретацию

        try {
            Date date = sdf.parse(dateStr);
            return date != null;
        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }
    }
}
