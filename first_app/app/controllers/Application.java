package controllers;

import play.*;
import play.mvc.*;

import views.html.*;
import play.data.*;
import static play.data.Form.*;
import models.Task;


    public class Application extends Controller {

        public Result index() {
            //return ok(index.render("Your new application is ready."));
            return redirect(routes.Application.tasks());
        }


        public Result newTask() {
            Form<Task> filledForm = taskForm.bindFromRequest();
            if(filledForm.hasErrors()) {
                return badRequest(
                        views.html.index.render(Task.all(), filledForm)
                );
            } else {
                Task.create(filledForm.get());
                return redirect(routes.Application.tasks());
            }
        }

        public Result tasks() {
            return ok(views.html.index.render(Task.all(), taskForm)
            );
        }


        public Result deleteTask(Long id) {
        Task.delete(id);
            return redirect(routes.Application.tasks());
        }
        static Form<Task> taskForm = form(Task.class);
    }
