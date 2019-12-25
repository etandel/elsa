defmodule ElsaWeb.MeasurementView do
  use ElsaWeb, :view
  alias ElsaWeb.MeasurementView

  def render("index.json", %{measurements: measurements}) do
    %{data: render_many(measurements, MeasurementView, "measurement.json")}
  end

  def render("show.json", %{measurement: measurement}) do
    %{data: render_one(measurement, MeasurementView, "measurement.json")}
  end

  def render("measurement.json", %{measurement: measurement}) do
    %{id: measurement.id,
      temperature: measurement.temperature}
  end
end
