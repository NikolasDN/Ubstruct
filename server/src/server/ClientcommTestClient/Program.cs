namespace ClientcommClient
{
    using System;
    using Microsoft.ServiceFabric.Actors;
    using Microsoft.ServiceFabric.Actors.Client;
    using Clientcomm.Interfaces;

    class Program
    {
        static void Main(string[] args)
        {
            var ClientcommTestClient = ActorProxy.Create<IClientcomm>(new ActorId(0x100), "fabric:/server" , "Clientcomm");
            int result = ClientcommTestClient.GetCountAsync().Result;
            ClientcommTestClient.SetCountAsync(result + 1).Wait();
            Console.WriteLine("Value = {0}", result);
        }
    }
}
