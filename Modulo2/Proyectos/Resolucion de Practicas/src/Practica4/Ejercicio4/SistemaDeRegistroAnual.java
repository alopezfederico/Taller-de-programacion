/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio4;

public class SistemaDeRegistroAnual extends SistemaDeRegistro {

    // Constructor que invoca al constructor de la clase base
    public SistemaDeRegistroAnual(EstacionMeteorologica estacion, int N, int A) {
        super(estacion, N, A);
    }

    @Override
    public String generarReporte() {
        StringBuilder reporte = new StringBuilder();
        reporte.append(getEstacion().getNombre())
               .append(" (")
               .append(getEstacion().getLatitud())
               .append(" - ")
               .append(getEstacion().getLongitud())
               .append("):\n");

        // Generar reporte de promedios anuales
        for (int i = 0; i < getN(); i++) {
            double promedioAnual = 0;
            for (int j = 0; j < 12; j++) {
                promedioAnual += getEstacion().getTemperatura(i, j);
            }
            promedioAnual /= 12.0;
            int year = getA() + i;
            reporte.append("Año ")
                   .append(year)
                   .append(": ")
                   .append(String.format("%.1f", promedioAnual))
                   .append(" ºC\n");
        }
        return reporte.toString();
    }
}
