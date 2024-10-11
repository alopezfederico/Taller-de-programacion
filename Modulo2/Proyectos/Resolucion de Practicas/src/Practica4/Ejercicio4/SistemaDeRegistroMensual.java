/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio4;

/**
 *
 * @author Fede
 */
public class SistemaDeRegistroMensual extends SistemaDeRegistro {

    public SistemaDeRegistroMensual(EstacionMeteorologica estacion, int N, int A) {
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

        // Generar reporte de promedios mensuales
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        for (int j = 0; j < 12; j++) {
            double promedioMensual = 0;
            for (int i = 0; i < getN(); i++) {
                promedioMensual += getEstacion().getTemperatura(i, j);
            }
            promedioMensual /= getN();
            reporte.append(meses[j])
                   .append(": ")
                   .append(String.format("%.1f", promedioMensual))
                   .append(" ºC\n");
        }
        return reporte.toString();
    }
}
