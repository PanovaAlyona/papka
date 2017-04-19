package com.pan.recipepuppy;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by Алена on 18.04.2017.
 */

public interface RecipesApi {
    @GET("/api")
    Call<List<RecipeModel>> getData();
}
