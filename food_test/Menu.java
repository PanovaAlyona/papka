import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 *
 * Меню. Список блюд
 *
 */
public class Menu {

    //todo Создайте свое меню. Должен быть хотя бы один конструктор, который создает объект класса Menu, содержащий список не менее чем из 10 блюд.
    //todo Должно быть не менее 10 блюд.
    //todo Список должен быть не пуст
    //todo Это намеки на создание тестов. Сначала тесты, потом реализация!
    public List<Meal> meals = new ArrayList<Meal>();
    public Menu(){
        meals.add(new Meal("sushi"));
        meals.add(new Meal("pizza"));
        meals.add(new Meal("borscht"));
        meals.add(new Meal("ucha"));
        meals.add(new Meal("potato"));
        meals.add(new Meal("icecream"));
        meals.add(new Meal("cake"));
        meals.add(new Meal("coffee"));
        meals.add(new Meal("tea"));
        meals.add(new Meal("compote"));

    }

    /**
     * Возвращает список блюд в меню.
     * Должен быть неизменяемым. @see Collections.unmodifiableList
     * Должен возвращать одну и ту же коллекцию объектов при кажом вызове.
     * @return список блюд в меню
     */
    public List<Meal> list(){

        return meals;
    }

}
