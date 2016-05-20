import java.util.ArrayList;
import java.util.List;

/**
 * Заказ
 */
public class Order {
    /**
     * Добавить одно блюдо в заказ.
     *
     * todo TESTS!
     * todo Блюдо должно быть из меню.
     * todo Блюдо должно быть не null.
     *
     * @param meal блюдо из меню
     */
    public Order(){

    }
    public List<Meal> listOfDishes = new ArrayList<Meal>();
    public void addMeal(Meal meal) {
        //throw new UnsupportedOperationException();
        if (InMenu(meal)) {
            listOfDishes.add(meal);
        }
        //else throw new IllegalArgumentException();
    }

    public Boolean InMenu(Meal meal){

        Menu menu = new Menu();
        return menu.meals.contains(meal);
        }
    //todo добавить возможность добавления нескольких порций  одного блюда, например, два чая.
    //todo addMeal(teaMeal, 2)
    //todo TESTS!
}
