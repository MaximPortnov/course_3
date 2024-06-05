package com.example.sr7;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Color;
import android.media.Image;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class PasswordActivity extends AppCompatActivity {

    private StringBuilder enteredPassword = new StringBuilder();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_password);

        // Настройка обработчиков нажатий на кнопки
        Button button1 = findViewById(R.id.button1);
        button1.setOnClickListener(view -> handleButtonClick("1"));
        button1.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button1.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button1.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(view -> handleButtonClick("2"));
        button2.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button2.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button2.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button3 = findViewById(R.id.button3);
        button3.setOnClickListener(view -> handleButtonClick("3"));
        button3.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button3.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button3.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button4 = findViewById(R.id.button4);
        button4.setOnClickListener(view -> handleButtonClick("4"));
        button4.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button4.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button4.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button5 = findViewById(R.id.button5);
        button5.setOnClickListener(view -> handleButtonClick("5"));
        button5.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button5.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button5.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button6 = findViewById(R.id.button6);
        button6.setOnClickListener(view -> handleButtonClick("6"));
        button6.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button6.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button6.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button7 = findViewById(R.id.button7);
        button7.setOnClickListener(view -> handleButtonClick("7"));
        button7.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button7.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button7.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });


        Button button8 = findViewById(R.id.button8);
        button8.setOnClickListener(view -> handleButtonClick("8"));
        button8.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button8.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button8.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button9 = findViewById(R.id.button9);
        button9.setOnClickListener(view -> handleButtonClick("9"));
        button9.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button9.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button9.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        Button button0 = findViewById(R.id.button0);
        button0.setOnClickListener(view -> handleButtonClick("0"));
        button0.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                button0.setTextColor(Color.WHITE); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                button0.setTextColor(Color.BLACK); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });

        ImageButton buttonDelete = findViewById(R.id.buttonDelete);
        buttonDelete.setBackgroundColor(Color.TRANSPARENT);
        buttonDelete.setOnClickListener(view -> deleteLastDigit());
        buttonDelete.setOnTouchListener((view, event) -> {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                buttonDelete.setImageDrawable(getDrawable(R.drawable.del_icon1));
//                buttonDelete.setBackgroundColor(Color.argb(2, 26, 111, 238)); // Установка цвета текста кнопки на белый при нажатии
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                buttonDelete.setImageDrawable(getDrawable(R.drawable.del_icon));

//                buttonDelete.setBackgroundColor(Color.argb(2, 255, 255, 255)); // Возвращение цвета текста кнопки на черный при отпускании
            }
            return false;
        });
    }

    // Метод для обработки нажатия на кнопку с цифрой
    private void handleButtonClick(String digit) {
        enteredPassword.append(digit);
        updatePasswordDisplay();

        if (enteredPassword.length() == 4) {
            Intent intent = new Intent(PasswordActivity.this, CardActivity.class);
            startActivity(intent);
            enteredPassword.setLength(0);
            updatePasswordDisplay();
        }

        TextView skipButton = findViewById(R.id.skipButton);
        skipButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Действия при нажатии на кнопку "Пропустить"
                Intent intent = new Intent(PasswordActivity.this, CardActivity.class);
                startActivity(intent);
            }
        });
    }

    // Метод для удаления последней введенной цифры
    private void deleteLastDigit() {
        if (enteredPassword.length() > 0) {
            enteredPassword.deleteCharAt(enteredPassword.length() - 1);
            updatePasswordDisplay();
        }
    }


        // Обновите изображения точек в соответствии с введенным паролем
        private void updatePasswordDisplay() {
            ImageView dot1 = findViewById(R.id.dot1);
            ImageView dot2 = findViewById(R.id.dot2);
            ImageView dot3 = findViewById(R.id.dot3);
            ImageView dot4 = findViewById(R.id.dot4);

            // Очистите изображения точек перед обновлением
            dot1.setImageResource(R.drawable.dot1);
            dot2.setImageResource(R.drawable.dot1);
            dot3.setImageResource(R.drawable.dot1);
            dot4.setImageResource(R.drawable.dot1);

            // Обновите изображения точек в соответствии с введенным паролем
            switch (enteredPassword.length()) {
                case 4:
                    dot4.setImageResource(R.drawable.dot2);
                    // Отсутствует break, чтобы кружки 1-3 не изменялись
                case 3:
                    dot3.setImageResource(R.drawable.dot2);
                    // Отсутствует break, чтобы кружки 1-2 не изменялись
                case 2:
                    dot2.setImageResource(R.drawable.dot2);
                    // Отсутствует break, чтобы кружок 1 не изменялся
                case 1:
                    dot1.setImageResource(R.drawable.dot2);
                    break;

            }
        }

}