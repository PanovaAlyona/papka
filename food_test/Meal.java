import java.util.Objects;

/**
 *
 * Еда. Пища. Блюдо.
 */
public class Meal {

    //todo Добавьте необходимые конструктуры и/или методы, чтобы можно было создать блюдо с указанием его наименования
    //todo Подумайте, что лучше подходит. Считается, что у блюда название не изменяется ;)
    public String name;
    public Meal(String name){
        this.name = name;
    }

    /**
     *
     * @return наименование блюда
     */
    public String getTitle(){
        return name;
        //throw new UnsupportedOperationException();
    }

  /*  @Override
    public boolean equals (Objects obj){
        if (obj instanceof Meal){
            Meal another = (Meal) obj;
            return another.getTitle().equals(this.getTitle());

        }
    }
    */
}
