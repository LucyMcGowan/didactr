% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ms_synthesize.R
\name{ms_synthesize}
\alias{ms_synthesize}
\title{Get Microsoft Text To Speech (TTS) or Cognitive
Services Token from API Key}
\usage{
ms_synthesize(script, token = NULL, api_key = NULL, gender = "Female",
  language = "en-US", output_format = c("raw-16khz-16bit-mono-pcm",
  "ssml-16khz-16bit-mono-tts", "audio-16khz-16kbps-mono-siren",
  "riff-16khz-16kbps-mono-siren", "riff-16khz-16bit-mono-pcm",
  "audio-16khz-128kbitrate-mono-mp3", "audio-16khz-64kbitrate-mono-mp3",
  "audio-16khz-32kbitrate-mono-mp3"), ...)
}
\arguments{
\item{script}{A character vector of lines to be spoken}

\item{token}{An authentication token, base-64 encoded usually from
\code{\link{get_ms_tts_token}}.  If not provided, will be created from
\code{\link{get_ms_tts_token}}}

\item{api_key}{Microsoft Cognitive Services API key, if token is not
provided.}

\item{gender}{Sex of the Speaker}

\item{language}{Language to be spoken,
must be from \code{\link{ms_language_codes}}}

\item{output_format}{Format of the output, see
\url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech/api-reference-rest/bingvoiceoutput}
for more information}

\item{...}{Additional arguments to send to \code{\link{POST}}}
}
\value{
A list of the request, content, token, and `SSML`.
}
\description{
Get Microsoft Text To Speech (TTS) or Cognitive
Services Token from API Key
}
\note{
The
content is likely in a binary format and the output depends on the
`output_format` chosen.  For example, if the `output_format` is an `MP3`,
then see below example
}
\examples{
\dontrun{
if (have_ms_tts_key()) {
res = ms_synthesize(script = "hey",
output_format = "audio-16khz-128kbitrate-mono-mp3")
tmp <- tempfile()
writeBin(out, con = tmp)
mp3 = tuneR::readMP3(tmp)
}

}
}
