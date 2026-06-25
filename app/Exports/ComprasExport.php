<?php

namespace App\Exports;
use App\Models\Compra;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ComprasExport{
    public function exportar(){
        $compras = Compra::with('producto')->get();

        $libroExcel = new Spreadsheet();
        $hoja = $libroExcel->getActiveSheet();

        $hoja->setCellValue('A1', 'ID-Compra');
        $hoja->setCellValue('B1', 'Nombre del comprador');
        $hoja->setCellValue('C1', 'ID-Producto');
        $hoja->setCellValue('D1', 'Producto');
        $hoja->setCellValue('E1', 'Cantidad');
        $hoja->setCellValue('F1', 'Precio unitario');
        $hoja->setCellValue('G1', 'Total');

        $fila = 2;
        foreach ($compras as $compra) {
            $hoja->setCellValue('A' . $fila, $compra->id);
            $hoja->setCellValue('B' . $fila, $compra->nombre_comprador);
            $hoja->setCellValue('C' . $fila, $compra->producto->id);
            $hoja->setCellValue('D' . $fila, $compra->producto->nombre);
            $hoja->setCellValue('E' . $fila, $compra->cantidad);
            $hoja->setCellValue('F' . $fila, $compra->producto->precio);
            $hoja->setCellValue('G' . $fila, $compra->total);
            $fila++;
        }

        $descarga = new Xlsx($libroExcel);
        return $descarga;
    }
}