# Check if unzip is installed
echo "Checking for dependencies..."
echo "Checking for unzip..."
if command -v unzip &> /dev/null; then
    echo "Unzip is installed. ✅"
else
    echo "Unzip is not installed. ❌ Install unzip by trying to run it in the terminal. Restart the shell/terminal then rerun this script."
    exit 1
fi
echo "Checking for wget..."
if command -v wget > /dev/null 2>&1; then
    echo "wget is installed. ✅"
else
    echo "wget is not installed. ❌ Install wget by trying to run it in the terminal. Restart the shell/terminal then rerun this script."
    exit 1
fi

# Clone the asset zip
wget https://github.com/JordanDJackson/nox-helper/archive/refs/heads/main.zip -O nox-helper.zip
# Unzip the zip
unzip nox-helper.zip -d ./public
# Remove image nesting
mv ./public/nox-helper-main/* ./public/
# Delete nested directory
echo "Cleaning up the place 🧹🧹🧹"
# rm -rf ./public/nox-helper-main/
# Create the "constants" directory at the root
mkdir -p ./constants
# Create a TypeScript file with the required mapping
cat <<EOL > ./constants/TylerImages.ts
const TylerImages = {
    bed: "/bed.webp",
    chair: "/chair.webp",
    endTable: "/end-table.webp",
    pillow: "/pillow.webp",
    sofa: "/sofa.webp",
    stool: "/stool.webp",
    tylersLogo: "tylers-logo.webp",
};

export default TylerImages;
EOL

echo "🥳🥳🥳 TypeScript file created in ./constants/TylerImages.ts You can now reference images using TylerImages.bed"
