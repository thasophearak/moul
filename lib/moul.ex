defmodule Moul do
  @moduledoc """
  Documentation for `Moul`.
  """

  require Logger

  @doc """
  Resize image at max 4096px at the long end with few additional sizes

  xl:4096
  lg:2048
  md:1024
  xs:32

  xs:32 is decoded hash

  ## Examples

      iex> Moul.moulify("path/to/file.jpeg", "out/path")
      {:ok, %{width: 0, height: 0, hash: ""}}

  """
  def moulify(in_file, out_path \\ "") do
    resize(in_file, out_path, :moulify)
  end

  @doc """
  Crop square image at max 512px with few additional sizes

  xl:512
  lg:256
  md:128
  xs:32

  xs:32 is decoded hash

  ## Examples

      iex> Moul.avatarize("path/to/file.jpeg", "out/path")
      {:ok, %{width: 0, height: 0, hash: ""}}

  """
  def avatarize(in_file, out_path \\ "") do
    resize(in_file, out_path, :avatarize)
  end

  def decode_blurhash(hash) when is_nil(hash), do: {:error, nil}

  def decode_blurhash(_hash) do
    {:ok, ""}
  end

  def decode_thumbhash(hash) when is_nil(hash), do: {:error, nil}

  def decode_thumbhash(_hash) do
    {:ok, ""}
  end

  def to_data_url!(in_file) when is_nil(in_file), do: nil

  def to_data_url!(in_file) do
    b64 =
      in_file
      |> File.read!()
      |> Base.encode64()

    "data:image/jpeg;charset=utf-8;base64,#{b64}"
  end

  def get_ideal_dimention(%{width: width, height: height} = _current_dimention, _ideal_dimention)
      when is_nil(width) or is_nil(height),
      do: {:error, :need_current_dimention}

  def get_ideal_dimention(
        _current_dimention,
        %{ideal_width: ideal_width, ideal_height: ideal_height} = _ideal_dimention
      )
      when not is_nil(ideal_width) and not is_nil(ideal_height),
      do: {:error, :not_ideal}

  def get_ideal_dimention(
        %{width: width, height: height} = _current_dimention,
        %{ideal_width: ideal_width} = _ideal_dimention
      )
      when not is_nil(ideal_width) do
    IO.inspect("#{width}:#{height}#{ideal_width}")

    {:ok, %{ideal_width: 0, ideal_height: 0}}
  end

  def get_ideal_dimention(
        %{width: width, height: height} = _current_dimention,
        %{ideal_height: ideal_height} = _ideal_dimention
      )
      when not is_nil(ideal_height) do
    IO.inspect("#{width}:#{height}#{ideal_height}")

    {:ok, %{ideal_width: 0, ideal_height: 0}}
  end

  defp resize(in_file, out_path, type) do
    default_args = ["photo", "--hash", Application.get_env(:moul, :hash, "thumbhash")]

    out_args = get_out_path(in_file, out_path)

    avatar_args =
      if type == :avatarize do
        ["--avatar", "true"]
      else
        []
      end

    args = default_args ++ ["--in", in_file] ++ avatar_args ++ out_args

    case System.cmd("moul", args) do
      {result, 0} ->
        meta = String.split(result, "\n", trim: true)
        dimention = meta |> List.first() |> String.split(":", trim: true)

        {:ok,
         %{hash: List.last(meta), width: List.first(dimention), height: List.last(dimention)}}

      {err, exit_status} ->
        IO.inspect(err)
        {:error, exit_status}
    end
  end

  defp get_out_path(in_file, out_path) do
    if out_path != "" do
      ["--out", out_path]
    else
      ["--out", Path.rootname(in_file)]
    end
  end
end
