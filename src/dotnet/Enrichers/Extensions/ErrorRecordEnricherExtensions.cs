using Serilog;
using Serilog.Configuration;

namespace PoShLog.Core.Enrichers.Extensions
{
	public static class ErrorRecordEnricherExtensions
	{
		public static LoggerConfiguration WithErrorRecord(this LoggerEnrichmentConfiguration loggerConfiguration, bool destructureObjects = false)
		{
			return loggerConfiguration.With(new ErrorRecordEnricher(destructureObjects));
		}
	}
}
