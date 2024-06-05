package com.example.sr7;


import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;
import java.util.Random;

public class CodeActivity extends AppCompatActivity {

    private EditText editText1, editText2, editText3, editText4;
    private TextView timerTextView;
    private CountDownTimer countDownTimer;
    private long timeLeftInMillis = 60000;
    private int generatedCode;
    private ImageButton backButton;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_code);

        timerTextView = findViewById(R.id.timerTextView);

        editText1 = findViewById(R.id.editText1);
        editText2 = findViewById(R.id.editText2);
        editText3 = findViewById(R.id.editText3);
        editText4 = findViewById(R.id.editText4);

        // Генерация кода при создании активности

        editText1.addTextChangedListener(createTextWatcher(editText2));
        editText2.addTextChangedListener(createTextWatcher(editText3));
        editText3.addTextChangedListener(createTextWatcher(editText4));

        editText4.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {}

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (charSequence.length() == 1) {
                    String code = editText1.getText().toString() +
                            editText2.getText().toString() +
                            editText3.getText().toString() +
                            editText4.getText().toString();
                    if (code.equals("1111")) {
                        Intent intent = new Intent(CodeActivity.this, PasswordActivity.class);
                        startActivity(intent);
                    }
                }
            }

            @Override
            public void afterTextChanged(Editable editable) {}
        });

        countDownTimer = new CountDownTimer(timeLeftInMillis, 1000) {
            @Override
            public void onTick(long millisUntilFinished) {
                timeLeftInMillis = millisUntilFinished;
                updateCountdownText();
            }

            @Override
            public void onFinish() {
                timerTextView.setVisibility(View.GONE);
            }
        }.start();

        backButton = findViewById(R.id.backButton);
        backButton.setBackgroundColor(Color.TRANSPARENT);

        backButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });
    }

    private void startTimer() {
        countDownTimer = new CountDownTimer(timeLeftInMillis, 1000) {
            @Override
            public void onTick(long millisUntilFinished) {
                timeLeftInMillis = millisUntilFinished;
                updateCountdownText();
            }

            @Override
            public void onFinish() {
                timerTextView.setVisibility(View.GONE);
            }
        }.start();
    }

    private TextWatcher createTextWatcher(final EditText nextEditText) {
        return new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {}

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (charSequence.length() == 1) {
                    nextEditText.requestFocus();
                }
            }

            @Override
            public void afterTextChanged(Editable editable) {}
        };
    }

    private String getCodeFromEditTexts() {
        return editText1.getText().toString() +
                editText2.getText().toString() +
                editText3.getText().toString() +
                editText4.getText().toString();
    }

    private void updateCountdownText() {
        int minutes = (int) (timeLeftInMillis / 1000) / 60;
        int seconds = (int) (timeLeftInMillis / 1000) % 60;

        String timeLeftFormatted = String.format(Locale.getDefault(), "%02d:%02d", minutes, seconds);
        timerTextView.setText("Отправить код повторно можно будет через: " + timeLeftFormatted);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
    }
}
