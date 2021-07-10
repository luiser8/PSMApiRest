using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace PSMApiRest.Lib
{
        public class AuthorizationFilter : DelegatingHandler
        {
            protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
            {
                var headers = request.Headers;
                if (headers.Authorization != null && headers.Authorization.Scheme == "Basic")
                {
                    var userPwd = Encoding.UTF8.GetString(Convert.FromBase64String(headers.Authorization.Parameter));
                    var user = userPwd.Substring(0, userPwd.IndexOf(":"));
                    var password = userPwd.Substring(userPwd.IndexOf(":") + 1);

                    if (user == "P$m" && password == "Bn@")
                    {
                        var principal = new GenericPrincipal(new GenericIdentity(user), null);
                        PutPrincipal(principal);
                    }
                }
                return base.SendAsync(request, cancellationToken);
            }

            private void PutPrincipal(IPrincipal principal)
            {
                Thread.CurrentPrincipal = principal;
                if (HttpContext.Current != null)
                {
                    HttpContext.Current.User = principal;
                }
            }
        }
}