package Practica4.Ejercicio4;

public class EstacionMeteorologica {
    private String nombre;
    private double latitud;
    private double longitud;
    private double[][] temperaturas;

    public EstacionMeteorologica(String nombre, double latitud, double longitud, int N) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        temperaturas = new double[N][12];
        // Inicializar todas las temperaturas a un valor muy alto (ej. 999.9)
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < 12; j++) {
                temperaturas[i][j] = 999.9;
            }
        }
    }

    public String getNombre() {
        return nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public double getTemperatura(int i, int j) {
        return temperaturas[i][j];
    }

    public void setTemperatura(int i, int j, double temp) {
        temperaturas[i][j] = temp;
    }
}
