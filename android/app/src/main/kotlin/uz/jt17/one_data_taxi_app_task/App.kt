package uz.jt17.one_data_taxi_app_task

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class App : Application() {

    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("b8353108-cb6f-41fc-a208-3a5e30cd5690")
    }

}