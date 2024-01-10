use clap::Parser;

///This is an example clap Cli app that can serve as a starting point for rust clap based github actions.
#[derive(Parser)]
#[command(author, version, about, long_about)]
struct Cli {
    /// Optional name to operate on. Github actions includes all inputs prefaced with 'INPUT_'.
    #[arg(short, long, env = "INPUT_NAME")]
    name: Option<String>,
}

fn main() {
    let cli = Cli::parse();

    // You can check the value provided by positional arguments, or option arguments
    if let Some(name) = cli.name.as_deref() {
        println!("Value for name: {name}");
        // --name logic here
    }
}
