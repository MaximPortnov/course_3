package com.example.sr7;

import static androidx.fragment.app.FragmentManager.TAG;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.bottomsheet.BottomSheetDialog;

import java.util.List;

public class AnalyzeAdapter extends RecyclerView.Adapter<AnalyzeAdapter.AnalyzeViewHolder> {

    private List<Analyze> analyzes;
    private int summCost = 0;
    private AnalyzeInterface analyzeInterface;
    public AnalyzeAdapter(List<Analyze> analyzes, AnalyzeInterface analyzeInterface) {
        this.analyzes = analyzes;
        this.analyzeInterface = analyzeInterface;
    }


    @NonNull
    @Override
    public AnalyzeAdapter.AnalyzeViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.analyze_item, parent, false);
        return new AnalyzeViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull AnalyzeAdapter.AnalyzeViewHolder holder, int position) {
        Analyze analyze = analyzes.get(position);
        holder.title.setText(analyze.title);
        holder.cost.setText(String.valueOf(analyze.cost));
        holder.days.setText(String.valueOf(analyze.days));
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                analyzeInterface.onItemClick();
            }
        });
        holder.button.setOnClickListener(new View.OnClickListener() {
            @SuppressLint({"ResourceAsColor", "RestrictedApi"})
            @Override
            public void onClick(View v) {
                if(!v.isActivated()){
                    summCost += analyze.cost;
                    v.setBackgroundResource(R.drawable.rounded_button2);
                    ((Button)v).setTextColor(Color.parseColor("#1A6FEE"));
                    ((Button)v).setText("Убрать");
                } else {
                    summCost -= analyze.cost;
                    ((Button)v).setTextColor(Color.parseColor("#FFFFFF"));
                    ((Button)v).setText("Добавить");
                    v.setBackgroundResource(R.drawable.rounded_button);
                }
                analyzeInterface.summUpdate(summCost);
                v.setActivated(!v.isActivated());
                Log.d(TAG, "onClick: " + summCost);
            }
        });

    }

    @Override
    public int getItemCount() {
        return analyzes.size();
    }

    public class AnalyzeViewHolder extends RecyclerView.ViewHolder {
        TextView title, cost, days;
        Button button;
        BottomSheetDialog bottomSheetDialog;

        public AnalyzeViewHolder(@NonNull View itemView) {
            super(itemView);
            button = itemView.findViewById(R.id.btn_add);
            title = itemView.findViewById(R.id.tv_title);
            days = itemView.findViewById(R.id.tv_days);
            cost = itemView.findViewById(R.id.tv_cost);
//            bottomSheetDialog = new BottomSheetDialog(itemView.getContext());
        }
        void createDialog(){
//            bottomSheetDialog.setContentView(view);
        }
    }
    public interface AnalyzeInterface{
        void summUpdate(int summ);
        void onItemClick();
    }
}
