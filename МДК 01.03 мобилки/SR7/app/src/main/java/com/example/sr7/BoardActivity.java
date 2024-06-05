package com.example.sr7;


import static androidx.fragment.app.FragmentManager.TAG;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.ViewPager2;
import java.util.ArrayList;
import java.util.List;

public class BoardActivity extends AppCompatActivity {

    private ViewPager2 viewPager;
    private myAdapter imagePagerAdapter;

    public static class myAdapter extends RecyclerView.Adapter<ImagePagerAdapter.ImageViewHolder> {


        private List<Integer> images;
        private GetItemInterface getItemInterface;

        public myAdapter(List<Integer> images, GetItemInterface getItemInterface) {
            this.images = images;
            this.getItemInterface = getItemInterface;
        }

        @NonNull
        @Override
        public ImagePagerAdapter.ImageViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_image, parent, false);
            return new ImagePagerAdapter.ImageViewHolder(view);
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public void onBindViewHolder(@NonNull ImagePagerAdapter.ImageViewHolder holder, @SuppressLint("RecyclerView") int position) {
            int imageRes = images.get(position);
            holder.imageView.setOnTouchListener(new View.OnTouchListener() {
                @SuppressLint("ClickableViewAccessibility")
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    getItemInterface.itemChanged(position);
                    return false;
                }
            });
            holder.imageView.setImageResource(imageRes);
        }

        @Override
        public int getItemCount() {
            return images.size();
        }

        class ImageViewHolder extends RecyclerView.ViewHolder {
            ImageView imageView;
            ImageViewHolder(View itemView) {
                super(itemView);
                imageView = itemView.findViewById(R.id.imageView);
            }
        }
        interface GetItemInterface {
            void itemChanged(int i);
        }
    }

    @SuppressLint({"RestrictedApi", "ClickableViewAccessibility"})
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_board);

        viewPager = findViewById(R.id.viewPager);

        List<Integer> images = new ArrayList<>();
        images.add(R.drawable.image1);
        images.add(R.drawable.image2);
        images.add(R.drawable.image3);

        RelativeLayout relativeLayout = findViewById(R.id.screenBoard);

        TextView skipButton = findViewById(R.id.skipButton);
//        imagePagerAdapter = new ImagePagerAdapter(images);
        imagePagerAdapter = new myAdapter(images, new myAdapter.GetItemInterface() {
            @Override
            public void itemChanged(int i) {
                Log.d(TAG, "onTouchEvent: " + i);
                if(i == 2){
                    skipButton.setText("Завершить");
                } else {
                    skipButton.setText("Пропустить");

                }
            }
        });
        viewPager.setAdapter(imagePagerAdapter);
        skipButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Действия при нажатии на кнопку "Пропустить"
                Intent intent = new Intent(BoardActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        });

    }

    @SuppressLint("RestrictedApi")
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return super.onTouchEvent(event);
    }
}