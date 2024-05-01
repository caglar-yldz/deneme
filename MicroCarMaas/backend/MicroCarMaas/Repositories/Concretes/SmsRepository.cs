using Azure;
using JetSms;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace MicroCarMaas.API.Repositories.Concretes
{
    public class SmsRepository : ISmsRepository
    {
        private readonly SMSServiceSoap _smsServiceSoap;
        private readonly string User = "Otokar_otp3";
        private readonly string Password = "34MuG*_iO?";
        private readonly string Originator = "OTOKAR";

        public SmsRepository(SMSServiceSoap sMSServiceSoap)
        {
            _smsServiceSoap = sMSServiceSoap;
        }
        public async Task<string> SendSmsAsync(string Recipients, string Messages)
        {
            var sendSmsBody = new SendSMSSingleRequestBody
            {
                user = User,
                password = Password,
                originator = Originator,
                receipents = Recipients,
                messages = Messages
            };
            var sendsms = new SendSMSSingleRequest(sendSmsBody);
            var response = await _smsServiceSoap.SendSMSSingleAsync(sendsms);
            return (response.Body.SendSMSSingleResult).ToString();
        }
    }
}
