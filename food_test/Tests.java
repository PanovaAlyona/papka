import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 *
 * ТЕСТЫ!!! TestDrivenDevelopment rules!!!
 */


public class Tests {
    Order o=null;

    /**
     * Этот метод подготовительный. Он всегда вызывается перед запуском любого теста или пачки тестов.
     * В нем удобно подготавливать (prepare) объекты, которые будут подвергаться множеству тестов. Например, подключить тестовую базу данных.
     *
     * В нашем случае показан пример создания заказа, состоящего из первого блюда списка блюд нашего меню.
     */
    @Before
    public void preparation(){
        o = new Order();
        Menu menu = new Menu();
        List<Meal> menuList = menu.list();
        if (!menuList.isEmpty()) {

            Meal mealFirst = menuList.get(0);
            if (mealFirst != null) {
                o.addMeal(mealFirst);
            }
        }
    }

    /**
     * Демонстрирует базовые возможности библиотеки тестирования JUnit.
     * Можно задавать несколько видов тестов.
     */
    @Test
    public void testExample(){
        //Проверка на истину булевого выражения
        assertTrue("Это все знают! Да или нет?!", 2+2 == 4);
        //Проверка на равенство объектов. Объекты сравниваются методом @see Object.equals
        assertEquals(new Integer(10), new Integer(10));
        //Проверка на неравенство. Да! 10 и "10" не равны. Это вам не JavaScript ;)
        assertNotEquals(10, "10");
        //Проверка на не пустоту
        assertNotNull(new Tests());
        //Проверка на пустоту
        assertNull(null);
        //Order создан, заранее заготовлен в методе prepare. Проверим его на не пустоту. Отрабатывает ли prepare???
        assertNotNull(o);
    }


    /**
     * Этот тест всегда проваливается. Пример реакции системы Unit Testing в случае некорректной реализации.
     * Эмулируется ошибка. На вход заведомо подаются некорректные данные.
     */
    @Test
    public void testFail() {
        assertTrue("Это все знают! Да или нет?!", 2 + 2 == 5);
        assertEquals(new Integer(10), "10");
        assertNull(new Tests());
    }

    /*
        Тест проверяет кидание исключения IllegalArgumentException в случае, если в заказ добавляется что-то не из Меню.
    */
    @Test(expected= IllegalArgumentException.class)
    public void testNotInPrice(){
        new Order().addMeal(new Meal("pizza"));
    }

    @Test
    public void inMenuTest(){

        assertEquals(new Order().InMenu(new Meal("pizza")),true);
    }

    //@Test
    //public void

}


