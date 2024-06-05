package com.example.sr7;

import androidx.lifecycle.ViewModelProvider;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class ProfileFragment extends Fragment {

    private EditText editText1;
    private EditText editText2;
    private EditText editText3;
    private EditText editText4;
    private TextView gender;
    static String text1, text2, text3, text4, selectedGender;
    private Spinner genderSpinner;
    static CharSequence selectedGender1;
    private Button btn;

    private ProfileViewModel mViewModel;
    View view1;
    public static ProfileFragment newInstance() {
        return new ProfileFragment();
    }

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_profile, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        view.findViewById(R.id.editText);
        view1 = view;

        editText1 = view.findViewById(R.id.editText);
        editText2 = view.findViewById(R.id.editText2);
        editText3 = view.findViewById(R.id.editText3);
        editText4 = view.findViewById(R.id.editText4);
        genderSpinner = view.findViewById(R.id.genderSpinner);
        gender = view.findViewById(R.id.gender);
        editText1.setText(CardActivity.text1, TextView.BufferType.EDITABLE);
        editText2.setText(CardActivity.text2, TextView.BufferType.EDITABLE);
        editText3.setText(CardActivity.text3, TextView.BufferType.EDITABLE);
        editText4.setText(CardActivity.text4, TextView.BufferType.EDITABLE);
        gender.setText(CardActivity.selectedGender);
        btn =  view.findViewById(R.id.button1);
        btn.setEnabled(false);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                CardActivity.text1 = String.valueOf(editText1.getText());
                CardActivity.text2 = String.valueOf(editText2.getText());
                CardActivity.text3 = String.valueOf(editText3.getText());
                CardActivity.text4 = String.valueOf(editText4.getText());
                Log.d("asd", "save");
            }
        });
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
    }
    private void checkFieldsForEmptyValues() {
        text1 = editText1.getText().toString().trim();
        text2 = editText2.getText().toString().trim();
        text3 = editText3.getText().toString().trim();
        text4 = editText4.getText().toString().trim();


        if (!TextUtils.isEmpty(text1) && !TextUtils.isEmpty(text2) && !TextUtils.isEmpty(text3)
                && !TextUtils.isEmpty(text4) ) {
            btn.setEnabled(true);
            btn.setBackgroundResource(R.drawable.rounded_button);
        } else {
            btn.setEnabled(false);
            btn.setBackgroundResource(R.drawable.rounded_button1);
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