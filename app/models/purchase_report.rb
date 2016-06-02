class PurchaseReport
  def self.build
    calculate.first.attributes
  end

  def self.calculate
    @query ||= Purchase.
      joins(:product).
      select("count(compras.id) as total_compras, (SUM(compras.precio) - SUM(productos.precio)) as ganancias, (AVG(compras.precio) - AVG(productos.precio)) as diferencia_promedio, (MAX(compras.precio) - MIN(productos.precio)) as diferencia_maxima, (MIN(compras.precio) - MAX(productos.precio)) as diferencia_minima").
      where(fecha: Date.today.beginning_of_week..Date.today.end_of_week)
  end
end
