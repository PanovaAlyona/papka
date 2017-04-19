package com.pan.recipepuppy;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Алена on 19.04.2017.
 */

public class Controller {
    static final String BASE_URL = "http://www.recipepuppy.com/";

    public static RecipesApi getApi() {
        Gson gson = new GsonBuilder()
                .setLenient()
                .create();

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build();

        RecipesApi umoriliApi = retrofit.create(RecipesApi.class);
        return umoriliApi;

    }
}
