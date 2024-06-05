package com.example.ui.home;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.sr7.Analyze;
import com.example.sr7.AnalyzeAdapter;
import com.example.sr7.R;
import com.example.sr7.databinding.FragmentHomeBinding;
import com.google.android.material.bottomsheet.BottomSheetDialog;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class HomeFragment extends Fragment {

    private FragmentHomeBinding binding;

    @SuppressLint("NotifyDataSetChanged")
    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        HomeViewModel homeViewModel =
                new ViewModelProvider(this).get(HomeViewModel.class);

        binding = FragmentHomeBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        RecyclerView recyclerView = binding.recyclerView1;
        List<Analyze> analyzes = new ArrayList<>();
        analyzes.add(new Analyze("ПЦР-тест на определение РНК коронавируса стандартный", 2, 1800));
        analyzes.add(new Analyze("Клинический анализ крови с лейкоцитарной формулировкой", 1, 690));
        analyzes.add(new Analyze("Биохимический анализ крови, базовый", 1, 2440));
        analyzes.add(new Analyze("test", 1, 1999));
        analyzes.add(new Analyze("test", 1, 234));
        binding.shopperView.setVisibility(View.GONE);
        BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(requireContext());
        View view = getLayoutInflater().inflate(R.layout.bottom_sheet_dialog, null, false);
        bottomSheetDialog.setContentView(view);
        AnalyzeAdapter analyzeAdapter = new AnalyzeAdapter(analyzes, new AnalyzeAdapter.AnalyzeInterface() {
            @Override
            public void summUpdate(int summ) {
                if(summ != 0){
                    binding.shopperView.setVisibility(View.VISIBLE);
                    binding.btnShop.setText("В корзину " + summ + "₽");
                } else {
                    binding.shopperView.setVisibility(View.GONE);
                }
            }

            @Override
            public void onItemClick() {
                bottomSheetDialog.show();
                bottomSheetDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

            }
        });
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setAdapter(analyzeAdapter);
        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}