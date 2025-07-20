import styles from "./page.module.css";
import { Todo } from "@/components/Todos";

export default function Home() {
  return (
    <div className={`${styles.page}`}>
      <main className={styles.main}>
        <Todo id="1" />
      </main>
    </div>
  );
}
