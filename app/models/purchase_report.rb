class PurchaseReport
  class << self
    def build
      calculations_from_differences.merge(promedio_ventas_por_minuto: sales_avg_per_min)
    end

    def calculations_from_differences
      q = Purchase.
        select("AVG(t.precio_compra - t.precio_producto) as diferencia_promedio, MAX(t.precio_compra - t.precio_producto) as diferencia_maxima, MIN(t.precio_compra - t.precio_producto) as diferencia_minima, SUM(t.precio_compra - t.precio_producto) as ganancias").
        from(purchase_prices, :t)
      q[0].attributes
    end

    def purchase_prices
      Purchase.
        joins(:product).
        select("COALESCE(productos.precio, 0) as precio_producto, COALESCE(compras.precio, 0) as precio_compra, productos.id as id_producto").
        where(fecha: Date.today.beginning_of_week..Date.today.end_of_week)
    end

    def sales_avg_per_min
      q = Purchase.
        select("AVG(t.ventas_por_dia) as avg_ventas_per_min").
        from(grouped_sales_by_date, :t)
      q[0].attributes["avg_ventas_per_min"]
    end

    def grouped_sales_by_date
      Purchase.
        select("COUNT(id)/1440 as ventas_por_dia, DATE_FORMAT(fecha,'%M %d %Y') as fecha_compra").
        group("fecha_compra").
        where(fecha: Date.today.beginning_of_week..Date.today.end_of_week)
    end
  end
end
