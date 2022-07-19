import Head from 'next/head';

export default function Layout({ children, pagina }) {
    return (
        <>
        <Head>
            <title>Café - {pagina}</title>
            <meta name="description" content="Quiosco Cafetería" />
        </Head>

        <div className='md:flex'>
            <aside className='md:w-4/12'>
                <h1>Sidebar aqui</h1>
            </aside>

            <main className='md:w-8/12'>
                {children}
            </main>
        </div>
        </>
    )
}