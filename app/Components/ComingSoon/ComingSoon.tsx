import Image from "next/image";
import "./Style.css";
import Link from "next/link";

export default function Page() {
  return (
    <div className="comming-soon">
      <Image
        className="mb-72"
        src="/fedorg.png"
        width={280}
        height={280}
        alt="FEDORG Coming Soon"
      />
      <h1>Coming Soon</h1>
      <p>Pledge to feed Organic</p>

      <div className="follow">
        <h5>Follow Us</h5>
        <Link href="https://www.facebook.com/iamfedorg" target="_blank">
          <Image src="/fb.png" width={40} height={40} alt="Facebook Follow" />
        </Link>
      </div>
    </div>
  );
}
