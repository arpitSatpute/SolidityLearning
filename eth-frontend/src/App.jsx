import React, { use } from 'react'
import { useConnectors, useDisconnect, WagmiProvider, useAccount, useBalance } from 'wagmi'
import { config } from '../config'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

function App() {

  const client = new QueryClient();

  return (
    <div>
      <WagmiProvider config={config}>
        <QueryClientProvider client={client} >
          <ConnectWallet />
        </QueryClientProvider>
      </WagmiProvider>
    </div>
  )
}


function ConnectWallet() {
  
  const connector = useConnectors();
  const { address } = useAccount();
  const { disconnect } = useDisconnect();
  const { data: balance, isLoading: balanceLoading } = useBalance({ address });

  if (address) {
    return(
      <div>
        You are connected with : {address}
        <br />
        Balance: {balanceLoading ? 'Loading...' : balance ? `${balance.value} ${balance.symbol}` : 'Unable to fetch balance'}
        <br />
        <button onClick={() => disconnect()}>Disconnect</button>
      </div>
    )
  }

  return (
    <div>
      {connector.map((c) => (
        <button key={c.id} onClick={() => c.connect()}>
           {c.name}
        </button>
      ))}
    </div>
  );
}

export default App