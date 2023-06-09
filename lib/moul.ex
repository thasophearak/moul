defmodule Moul do
  @moduledoc """
  Opinionated Image Resizing Library

  > This package requires a static binary, `https://github.com/moul-co/moul/releases` >= `v5.0.0-rc.5` to be in `$PATH`.

  There are two resizing options:

  - `moulify/2` For general use. This option maintains the aspect ratio and creates different sizes for `srcset`.
  - `avatarize/2` For resizing avatars with square crop and center anchor. This option also creates different sizes for `srcset`.

  In addition, there are helper functions available for converting to data URLs: `decode_blurhash/3`, `decode_thumbhash/1`, and `to_data_url!/1`.


  There are two hashing options available:

  - BlurHash [https://github.com/woltapp/blurhash](https://github.com/woltapp/blurhash)
  - ThumbHash [https://github.com/evanw/thumbhash](https://github.com/evanw/thumbhash)

  By default, `moul` uses ThumbHash, but it can also be configured to use BlurHash.

  ```elixir
  config :moul,
    hash: "blurhash"
  ```

  """

  require Logger

  @doc """
  Resize image at max 4096px at the long end with few additional sizes

  - xl:4096
  - lg:2048
  - md:1024
  - xs:32

  xs:32 is decoded hash

  ## Examples

      iex> Moul.moulify("test/images/dscf3742-4k-by-phearak-s-tha.jpeg")
      {:ok,
      %{
        hash: "2DgSJYhld3d/d4eDeJh4eGZ2YHYH",
        height: "2731",
        width: "4096"
      }}
  """
  def moulify(in_file, out_path \\ "") do
    resize(in_file, out_path, :moulify)
  end

  @doc """
  Crop square image at max 512px with few additional sizes

  - xl:512
  - lg:256
  - md:128
  - xs:32

  xs:32 is decoded hash

  ## Examples

      iex> Moul.avatarize("test/images/profile.png")
      {:ok,
      %{
        hash: "GwgSFwKLZYZ/eHZHZ1aWZ4iHyAgpjaAC",
        height: "1190",
        width: "1190"
      }}
  """
  def avatarize(in_file, out_path \\ "") do
    resize(in_file, out_path, :avatarize)
  end

  def decode_blurhash(hash, width, height) when is_nil(hash) or is_nil(width) or is_nil(height),
    do: {:error, nil}

  @doc """
  Decode blurhash and return data URL

  ## Examples

      iex> Moul.decode_blurhash("VUGQ:~EMI:s:WB_2R*WBoLay1O$$snWVjt$jsnWVWWaz", 4096, 2731)
      {:ok,
      "data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIABUAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AKGg+KYo5hzXdaD4hW62qK+XPCXx18M3s426rEee0gr1Lwp8YvDcZRjqMf8A32K+Iq5/XjHSDufo+E4JrOp70j6G0mEzwbh3FYnivTHYmuf8P/HLw0tsB/aEfT+8KzPFfx68MR5J1CL8XFedU4kx0I3UGetV4Lw1rOWp+Bej/Erx5o8mdN8VXkOTyUmIrqtM/aY+NmlqFg8eXbgdPMIP9K85i/1gq1X7JllGhWotVIJ69Umfl39r5rTknGvNf9vP/M9g0r9tf9oHT4/KXxUkg9ZYf8CKyvFH7XPx81vLzeOZYQR923jUD9QTXncPX8agvvufhXv43Kssp5c6kaMOa2/Kv8jN51m1Wp71eX3s/9k="}
  """
  def decode_blurhash(hash, width, height) do
    args = ["decode", "--blurhash", "#{hash}", "--width", "#{width}", "--height", "#{height}"]

    case System.cmd("moul", args) do
      {result, 0} ->
        {:ok, result}

      {_, exit_status} ->
        {:error, exit_status}
    end
  end

  def decode_thumbhash(hash) when is_nil(hash), do: {:error, nil}

  @doc """
  Decode thumbhash and return data URL

  ## Examples

      iex> Moul.decode_thumbhash("GwgSFwKLZYZ/eHZHZ1aWZ4iHyAgpjaAC")
      {:ok,
        "data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APcP+COn7HviXwnMPttk6/Va7P8A4Ksfsf6r4vTZHAxJHpX0n+z78aPhx8LbV5bbyEwOxArxL9ub9vbwTd3jQm4iIXpyKrB8RxUjfE5RJo+OPgP+xle+CLA3d2hULzyK+iPgzZab4fvDbPcqCvBGa+c/ir/wUU8NeH/DEwsLiNTtOMNXz94G/wCCjupax4klNpdMRvPQ19Rh+JoKO587XyWTke0+Ev2wZfEcDQ2urk7h2krwH9rL4l6rfTPcPqDnPT5q8P8A2OfE+u+Ir9Y57piCe5r0r9qHwxdjSPO3nO3rX5Lh8JJM/Qa2Ji0fPPxE8ZXGpaW8Et+xB6/NV79mDS9HudUaW7uRknu1cL4q8P6jLayfvDxnvTPg9NrGi6kwjuGHPrXtU8PNLc8ydWLZ/9k="}
  """
  def decode_thumbhash(hash) do
    args = ["decode", "--thumbhash", "#{hash}"]

    case System.cmd("moul", args) do
      {result, 0} ->
        {:ok, result}

      {_, exit_status} ->
        {:error, exit_status}
    end
  end

  @doc """
  Tranform image to data URL

  ## Examples

      iex> Moul.to_data_url!("test/images/DSCF0527/xs-blurhash.jpeg")
      "data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAFQMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APwI07VbrTLxby3I3L2PQivfvhB+11ZaPZppPiO1aJlXAmAyp/LpXJ2v7HPxQnvks2SMb2A3BTivoH4Of8EtrnVbBNV18TXUpGQrAhR+A6/jXz2Y8UZBRjbEy5/Jbr/L5n2OW5PxLSpONJKMX3aav8r/AKGDfftIeGrqXzlvFwR61B/w0P4b/wCf1Pzr0vWv+Cchs7vyY9HbA9Fqn/w7ul/6A7/lXzf+ufCi05ZHof2dxkusPxPdo4PCdpqsRbyfvDjivrP9n9fB93ocanyj8o9K/DfVP2x/jHf3aXNvqEMITBClC2T9civa/gp/wVi8X+ALBLHxRoFxKyYHmWUgIb3IYjH0ya5sZwbiardTfyDAcXxjh1GS5X2f/A0P2O1nwl4Onuy4SH8hVT/hDPB//POD8hX5gyf8FpLeQ7hoWpj6ov8A8VTf+H0EH/QE1L/vhf8AGvEfBOMb+Bnrx4nptfHH/wACX+Z//9k="
  """
  def to_data_url!(in_file) when is_nil(in_file), do: nil

  def to_data_url!(in_file) do
    b64 =
      in_file
      |> File.read!()
      |> Base.encode64()

    "data:image/jpeg;charset=utf-8;base64,#{b64}"
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
        dimension = meta |> List.first() |> String.split(":", trim: true)

        {:ok,
         %{hash: List.last(meta), width: List.first(dimension), height: List.last(dimension)}}

      {_, exit_status} ->
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
