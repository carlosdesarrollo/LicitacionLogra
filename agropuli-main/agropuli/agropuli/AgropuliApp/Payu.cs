using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AgropuliApp
{
    public class Payu
    {
        #region Fields

        public static Dictionary<string, string> ResponseCodes = new Dictionary<string, string>()
        {
            {"APPROVED","La transacción fue aprobada."},
            {"DECLINED","La transacción fue declinada."},
            {"ERROR","Ocurrió un error procesando la transacción."},
            {"PENDING","La transacción quedó pendiente."},
            {"ENTITY_DECLINED","La transacción fue declinada por el banco."},
            {"ANTIFRAUD_REJECTED","La transacción fue rechazada por el sistema anti-fraude."},
            {"PENDING_TRANSACTION_REVIEW","La transacción fue detenida y debe ser revisada, esto puede ocurrir por filtros de seguridad."},
            {"INTERNAL_PAYMENT_PROVIDER_ERROR","Ocurrió un error en el sistema intentando procesar el pago."},
            {"INACTIVE_PAYMENT_PROVIDER","El proveedor de pagos no se encontraba activo."},
            {"DIGITAL_CERTIFICATE_NOT_FOUND","Certificado digital no encontrado."},
            {"PAYMENT_NETWORK_REJECTED","La red financiera rechazó la transacción."},
            {"INVALID_EXPIRATION_DATE_OR_SECURITY_CODE","Fecha de expiración o código de seguridad inválidos"},
            {"INSUFFICIENT_FUNDS","La cuenta no tenía fondos suficientes."},
            {"CREDIT_CARD_NOT_AUTHORIZED_FOR_INTERNET_TRANSACTIONS","La tarjeta de crédito no esta autorizada para transacciones por Internet."},
            {"INVALID_TRANSACTION","La red financiera reportó que la transacción fue inválida."},
            {"INVALID_CARD","La tarjeta es inválida."},
            {"EXPIRED_CARD","La tarjeta expiró."},
            {"RESTRICTED_CARD","La tarjeta presenta una restricción."},
            {"CONTACT_THE_ENTITY","Debe contactar al banco."},
            {"REPEAT_TRANSACTION","Se debe repetir la transacción."},
            {"ENTITY_MESSAGING_ERROR","La red financiera reportó un error de comunicaciones con el banco."},
            {"PENDING_TRANSACTION_CONFIRMATION","La transacción está pendiente de ser confirmada."},
            {"BANK_UNREACHABLE","Error de comunicación con el banco."},
            {"EXCEEDED_AMOUNT","La transacción excede el monto máximo establecido por el banco."},
            {"NOT_ACCEPTED_TRANSACTION","La transacción no fue aceptada por el banco."},
            {"ERROR_CONVERTING_TRANSACTION_AMOUNTS","Ocurrió un error convirtiendo los montos a la moneda de pago."},
            {"BANK_ACCOUNT_ACTIVATION_ERROR","Débito automático no permitido."},
            {"BANK_ACCOUNT_NOT_AUTHORIZED_FOR_AUTOMATIC_DEBIT","Débito automático no permitido."},
            {"INVALID_AGENCY_BANK_ACCOUNT","Débito automático no permitido."},
            {"INVALID_BANK_ACCOUNT","Débito automático no permitido."},
            {"INVALID_BANK","Débito automático no permitido."},
            {"ABANDONED_TRANSACTION","Transacción abandonada por el pagador."},
            {"PAYMENT_NETWORK_NO_CONNECTION","No fue posible establecer comunicación con la entidad financiera."},
            {"PAYMENT_NETWORK_NO_RESPONSE","No se recibió respuesta de la entidad financiera."},
            {"EXPIRED_TRANSACTION","La transacción excedió el tiempo de espera."}
        };

        private const char AMPERSAND = '&';
        private const char EQUALS = '=';
        private const char QUESTION = '?';
        private const char TILDE = '~';

        private string apiKey;
        private Dictionary<string, string> parameters = new Dictionary<string, string>();

        #endregion Fields

        #region Properties

        public string AccountId
        {
            get { return parameters["accountId"]; }
            set { parameters["accountId"] = value; }
        }

        public string Amount
        {
            get { return parameters["amount"]; }
            set { parameters["amount"] = value; }
        }

        public string ApiKey
        {
            get { return apiKey; }
            set { apiKey = value; }
        }

        public string BuyerEmail
        {
            get { return parameters["buyerEmail"]; }
            set { parameters["buyerEmail"] = value; }
        }

        public string Currency
        {
            get { return parameters["currency"]; }
            set { parameters["currency"] = value; }
        }

        public string Description
        {
            get { return parameters["description"]; }
            set { parameters["description"] = value; }
        }

        public string Lng
        {
            get { return parameters["lng"]; }
            set { parameters["lng"] = value; }
        }

        public string MerchantId
        {
            get { return parameters["merchantId"]; }
            set { parameters["merchantId"] = value; }
        }

        public Dictionary<string, string> Parameters
        {
            get;
            set;
        }

        public string ReferenceCode
        {
            get { return parameters["referenceCode"]; }
            set { parameters["referenceCode"] = value; }
        }

        public string ResponseUrl
        {
            get { return parameters["responseUrl"]; }
            set { parameters["responseUrl"] = value; }
        }

        public string ConfirmationUrl
        {
            get { return parameters["confirmationUrl"]; }
            set { parameters["confirmationUrl"] = value; }
        }

        public string Signature
        {
            get { return parameters["signature"]; }
            set { parameters["signature"] = value; }
        }

        public string Tax
        {
            get { return parameters["tax"]; }
            set { parameters["tax"] = value; }
        }

        public string TaxReturnBase
        {
            get { return parameters["taxReturnBase"]; }
            set { parameters["taxReturnBase"] = value; }
        }

        public string Test
        {
            get { return parameters["test"]; }
            set { parameters["test"] = value; }
        }

        public string Url { get; set; }

        #endregion Properties

        #region Methods

        public static string GetConfirmationSignature(
            string apiKey,
            string merchantID,
            string reference,
            string txValue,
            string currency,
            string transactionState
            )
        {
            StringBuilder signatureBuilder = new StringBuilder();

            signatureBuilder.Append(apiKey);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(merchantID);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(reference);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(txValue);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(currency);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(transactionState);

            return Helper.GetMD5Hash(signatureBuilder.ToString());
        }

        public void CreateSignature()
        {
            Signature = GetSignature();
        }

        public string GetParametersToPost()
        {
            StringBuilder parametersBuilder = new StringBuilder();

            parametersBuilder.Append(QUESTION);

            foreach (KeyValuePair<string, string> parameter in parameters)
            {
                parametersBuilder.Append(parameter.Key);
                parametersBuilder.Append(EQUALS);
                parametersBuilder.Append(parameter.Value);

                if (parameters.Last().Key != parameter.Key)
                {
                    parametersBuilder.Append(AMPERSAND);
                }
            }

            return parametersBuilder.ToString();
        }

        private string GetSignature()
        {
            StringBuilder signatureBuilder = new StringBuilder();

            signatureBuilder.Append(ApiKey);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(MerchantId);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(ReferenceCode);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(Amount);
            signatureBuilder.Append(TILDE);
            signatureBuilder.Append(Currency);

            return Helper.GetMD5Hash(signatureBuilder.ToString());
        }

        #endregion Methods
    }
}