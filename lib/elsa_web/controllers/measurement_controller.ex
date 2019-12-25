defmodule ElsaWeb.MeasurementController do
  use ElsaWeb, :controller

  alias Elsa.Measurements
  alias Elsa.Measurements.Measurement

  action_fallback ElsaWeb.FallbackController

  def index(conn, _params) do
    measurements = Measurements.list_measurements()
    render(conn, "index.json", measurements: measurements)
  end

  def create(conn, %{"measurement" => measurement_params}) do
    with {:ok, %Measurement{} = measurement} <- Measurements.create_measurement(measurement_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.measurement_path(conn, :show, measurement))
      |> render("show.json", measurement: measurement)
    end
  end

  def show(conn, %{"id" => id}) do
    measurement = Measurements.get_measurement!(id)
    render(conn, "show.json", measurement: measurement)
  end

  def update(conn, %{"id" => id, "measurement" => measurement_params}) do
    measurement = Measurements.get_measurement!(id)

    with {:ok, %Measurement{} = measurement} <- Measurements.update_measurement(measurement, measurement_params) do
      render(conn, "show.json", measurement: measurement)
    end
  end

  def delete(conn, %{"id" => id}) do
    measurement = Measurements.get_measurement!(id)

    with {:ok, %Measurement{}} <- Measurements.delete_measurement(measurement) do
      send_resp(conn, :no_content, "")
    end
  end
end
